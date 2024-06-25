#!/usr/bin/env bash

# Copy the utilities
echo "Updating the productivity script..."
cp productivity_script.sh ~/.productivity_script.sh

# Define the string to be added
SOURCE_STR="source ~/.productivity_script.sh"

# Function to insert source string into shell configuration file
insert_into_shell_config() {
    local shell_config_file=$1
    if ! grep -Fxq "$SOURCE_STR" "$shell_config_file"; then
        echo "$SOURCE_STR" >> "$shell_config_file"
        echo "Inserted script into $shell_config_file"
    else
        echo "Script already included in $shell_config_file"
    fi
}

# Check which shell the user is using and insert into the corresponding configuration file
case "$SHELL" in
    */bash)
        insert_into_shell_config ~/.bashrc
        source ~/.bashrc
        ;;
    */zsh)
        insert_into_shell_config ~/.zshrc
        source ~/.zshrc
        ;;
    */ksh)
        insert_into_shell_config ~/.kshrc
        source ~/.kshrc
        ;;
    */fish)
        insert_into_shell_config ~/.config/fish/config.fish
        source ~/.config/fish/config.fish
        ;;
    *)
        echo "Unsupported shell: $SHELL"
        ;;
esac
