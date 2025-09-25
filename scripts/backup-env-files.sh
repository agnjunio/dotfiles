#!/bin/bash

# Script to backup all .env files in home directory
# Usage: ./backup-env-files.sh [backup_directory]

set -euo pipefail

# Default backup directory
DEFAULT_BACKUP_DIR="$HOME/.env-backups"
BACKUP_DIR="${1:-$DEFAULT_BACKUP_DIR}"

# Create backup directory with timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_PATH="$BACKUP_DIR/$TIMESTAMP"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to create backup directory
create_backup_dir() {
    if [[ ! -d "$BACKUP_PATH" ]]; then
        mkdir -p "$BACKUP_PATH"
        print_status $GREEN "Created backup directory: $BACKUP_PATH"
    fi
}

# Function to backup .env files
backup_env_files() {
    local env_files_found=0
    local backup_count=0
    
    print_status $BLUE "Searching for .env files in home directory..."
    
    # Find all .env files in home directory
    while IFS= read -r -d '' file; do
        env_files_found=$((env_files_found + 1))
        
        # Get relative path from home directory
        relative_path="${file#$HOME/}"
        
        # Create directory structure in backup
        backup_file_dir="$BACKUP_PATH/$(dirname "$relative_path")"
        mkdir -p "$backup_file_dir"
        
        # Copy file to backup location
        backup_file="$BACKUP_PATH/$relative_path"
        cp "$file" "$backup_file"
        
        print_status $GREEN "✓ Backed up: $relative_path"
        backup_count=$((backup_count + 1))
        
    done < <(find ~ -type f -name ".env" -print0 2>/dev/null)
    
    if [[ $env_files_found -eq 0 ]]; then
        print_status $YELLOW "No .env files found in home directory"
        return 1
    fi
    
    print_status $GREEN "Successfully backed up $backup_count .env file(s)"
    return 0
}

# Function to create backup summary
create_summary() {
    local summary_file="$BACKUP_PATH/BACKUP_SUMMARY.txt"
    
    cat > "$summary_file" << EOF
ENV Files Backup Summary
========================
Backup Date: $(date)
Backup Location: $BACKUP_PATH
Source: Home directory ($HOME)

Files Backed Up:
EOF
    
    find "$BACKUP_PATH" -name ".env" -type f | while read -r file; do
        relative_file="${file#$BACKUP_PATH/}"
        echo "- $relative_file" >> "$summary_file"
    done
    
    print_status $BLUE "Backup summary created: BACKUP_SUMMARY.txt"
}

# Function to cleanup old backups (keep last 10)
cleanup_old_backups() {
    if [[ -d "$BACKUP_DIR" ]]; then
        local backup_count=$(find "$BACKUP_DIR" -maxdepth 1 -type d -name "20*" | wc -l)
        
        if [[ $backup_count -gt 10 ]]; then
            print_status $YELLOW "Cleaning up old backups (keeping last 10)..."
            find "$BACKUP_DIR" -maxdepth 1 -type d -name "20*" | sort | head -n -10 | xargs rm -rf
            print_status $GREEN "Old backups cleaned up"
        fi
    fi
}

# Main execution
main() {
    print_status $BLUE "Starting .env files backup..."
    print_status $BLUE "Backup directory: $BACKUP_PATH"
    
    # Create backup directory
    create_backup_dir
    
    # Backup .env files
    if backup_env_files; then
        # Create summary
        create_summary
        
        # Cleanup old backups
        cleanup_old_backups
        
        print_status $GREEN "Backup completed successfully!"
        print_status $BLUE "Backup location: $BACKUP_PATH"
    else
        print_status $RED "Backup failed - no .env files found"
        exit 1
    fi
}

# Show usage if help requested
if [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    echo "Usage: $0 [backup_directory]"
    echo ""
    echo "Backup all .env files in home directory"
    echo ""
    echo "Arguments:"
    echo "  backup_directory    Optional custom backup directory (default: $DEFAULT_BACKUP_DIR)"
    echo ""
    echo "Options:"
    echo "  -h, --help         Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                                    # Backup to default location"
    echo "  $0 /tmp/env-backups                   # Backup to custom location"
    echo "  $0 ~/Documents/env-backups            # Backup to Documents folder"
    exit 0
fi

# Run main function
main