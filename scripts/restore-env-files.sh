#!/bin/bash

# Script to restore .env files from backup directories
# Usage: ./restore-env-files.sh /path/to/backup/timestamp

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Function to print error and exit
print_error() {
    print_status $RED "Error: $1"
    exit 1
}

# Function to show usage
show_usage() {
    echo "Usage: $0 /path/to/backup/timestamp"
    echo ""
    echo "Restore .env files from a backup directory"
    echo ""
    echo "Arguments:"
    echo "  backup_path    Full path to the backup directory (e.g., /mnt/e/env-backups/20250925_143827)"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 /mnt/e/env-backups/20250925_143827"
    echo "  $0 ~/.env-backups/20240101_120000"
}

# Function to read user input
read_input() {
    local prompt="$1"
    local default="$2"
    local response=""
    
    echo -n "$prompt"
    if [[ -t 0 ]]; then
        # Interactive mode - read from terminal
        read -r response < /dev/tty
    else
        # Non-interactive mode - try to read from stdin
        if read -r response; then
            if [[ -z "$response" ]]; then
                response="$default"
            fi
        else
            response="$default"
        fi
    fi
    echo "$response"
}

# Function to show backup summary
show_backup_summary() {
    local backup_path="$1"
    local summary_file="$backup_path/BACKUP_SUMMARY.txt"
    
    if [[ -f "$summary_file" ]]; then
        echo ""
        print_status $CYAN "Backup Summary:"
        echo "==============="
        cat "$summary_file"
        echo ""
    fi
}

# Function to restore .env files
restore_env_files() {
    local backup_path="$1"
    
    if [[ ! -d "$backup_path" ]]; then
        print_error "Backup directory does not exist: $backup_path"
    fi
    
    print_status $BLUE "Restoring .env files from: $backup_path"
    echo ""
    
    # Find all .env files in backup
    local env_files_found=0
    local restore_count=0
    
    # Create temporary file to store file list
    local temp_file=$(mktemp)
    find "$backup_path" -name ".env" -type f > "$temp_file"
    
    # Process each .env file
    while IFS= read -r backup_file; do
        env_files_found=$((env_files_found + 1))
        
        # Get relative path from backup directory
        relative_path="${backup_file#$backup_path/}"
        
        # Skip BACKUP_SUMMARY.txt
        if [[ "$relative_path" == "BACKUP_SUMMARY.txt" ]]; then
            continue
        fi
        
        # Target file path
        target_file="$HOME/$relative_path"
        target_dir=$(dirname "$target_file")
        
        # Create target directory if it doesn't exist
        if [[ ! -d "$target_dir" ]]; then
            mkdir -p "$target_dir"
            print_status $CYAN "Created directory: $target_dir"
        fi
        
        # Check if target file already exists
        if [[ -f "$target_file" ]]; then
            print_status $YELLOW "⚠ Overwriting existing file: $relative_path"
        fi
        
        # Copy file to target location
        cp "$backup_file" "$target_file"
        print_status $GREEN "✓ Restored: $relative_path"
        restore_count=$((restore_count + 1))
        
    done < "$temp_file"
    
    # Clean up temporary file
    rm -f "$temp_file"
    
    if [[ $env_files_found -eq 0 ]]; then
        print_status $YELLOW "No .env files found in backup"
        return 1
    fi
    
    echo ""
    print_status $GREEN "Restore completed successfully!"
    print_status $BLUE "Files restored: $restore_count"
    
    return 0
}

# Main execution
main() {
    # Parse arguments
    if [[ $# -eq 0 ]]; then
        show_usage
        exit 1
    fi
    
    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        show_usage
        exit 0
    fi
    
    local backup_path="$1"
    
    # Show backup summary
    show_backup_summary "$backup_path"
    
    # Proceed with restore
    print_status $BLUE "Starting restore process..."
    
    # Restore files
    restore_env_files "$backup_path"
}

# Run main function
main "$@"