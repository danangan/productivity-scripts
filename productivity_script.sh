
# This function allows you to do git commit that accept the messages as parameters
# Example usage: commit My commit message
function commit() {
    # If no arguments are provided, set the default commit message to "."
    if [ $# -eq 0 ]; then
        COMMIT_MESSAGE="."
    else
        # Use all arguments as the commit message
        COMMIT_MESSAGE="$*"
    fi

    # Change to the top-level directory of the Git repository
    cd "$(git rev-parse --show-toplevel)"

    # Stage all changes
    git add .

    # Commit with the provided message
    git commit -m "$COMMIT_MESSAGE"

    # Push the changes
    git push

    # Return to the original directory
    cd -
}

