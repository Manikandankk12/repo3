pipeline {
    agent any

    stages {
        stage('Create Directory') {
            steps {
                sh '''
                    #!/bin/bash
                    DIR_NAME="/home/administrator/myfolder"

                    mkdir -p "$DIR_NAME"

                    if [ -d "$DIR_NAME" ]; then
                        echo "Directory created: $DIR_NAME"
                    else
                        echo "Failed to create directory: $DIR_NAME"
                        exit 1
                    fi
                '''
            }
        }

        stage('Create File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/hello.sh"

                    echo '#!/bin/bash' > "$FILE_NAME"
                    echo 'echo Hello from Jenkins!' >> "$FILE_NAME"

                    echo "File created: $FILE_NAME"
                '''
            }
        }

        stage('Execute File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/myfolder/hello.sh"

                    # Make sure file exists before running
                    if [ -f "$FILE_NAME" ]; then
                        bash "$FILE_NAME"
                    else
                        echo "File not found: $FILE_NAME"
                        exit 1
                    fi
                '''
            }
        }

        stage('Change Permissions') {
            steps {
                sh '''
                    #!/bin/bash
                    DIR_NAME="/home/administrator/myfolder"
                    FILE_NAME="$DIR_NAME/hello.sh"

                    chmod 755 "$DIR_NAME"
                    chmod 744 "$FILE_NAME"

                    echo "Permissions updated:"
                    ls -l "$DIR_NAME"
                '''
            }
        }
    }
}

