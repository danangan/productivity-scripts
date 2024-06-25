#!/usr/bin/env bash

# Copy the utilities
echo "Updating the utilities script..."
cp productivity_script.sh ~/.productivity_script.sh

# Define the string to be added
SOURCE_STR="source ~/.productivity_script.sh"

# Function to insert source string into shell configuration file
insert_into_shell_config() {
    local shell_config_file=$1
    if ! grep -Fxq "$SOURCE_STR" "$shell_config_file"; then
        echo "$SOURCE_STR" >> "$shell_config_file"
        echo "Script insterted into $shell_config_file."
    else
        echo "Script already included in $shell_config_file."
    fi
}

post_install() {
    local shell_config_file=$1

    echo "Reload your terminal or run \"source $shell_config_file\" to load the utilities."
}

# Check which shell the user is using and insert into the corresponding configuration file
case "$SHELL" in
    */bash)
        insert_into_shell_config ~/.bashrc
        post_install ~/.bashrc
        ;;
    */zsh)
        insert_into_shell_config ~/.zshrc
        post_install ~/.zshrc
        ;;
    */ksh)
        insert_into_shell_config ~/.kshrc
        post_install ~/.kshrc
        ;;
    */fish)
        insert_into_shell_config ~/.config/fish/config.fish
        post_install ~/.config/fish/config.fish
        ;;
    *)
        echo "Unsupported shell: $SHELL"
        ;;
esac
