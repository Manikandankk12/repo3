pipeline {
    agent any

    stages {
        stage('Check/Create Directory') {
            steps {
                sh '''
                    #!/bin/bash
                    DIR_NAME="/home/administrator/myfolder"
                    ALIAS_NAME="MCET"

                    # If directory exists, just confirm; otherwise try to create
                    if [ -d "$DIR_NAME" ]; then
                        echo "Directory already exists: $DIR_NAME (alias: $ALIAS_NAME)"
                    else
                        sudo mkdir -p "$DIR_NAME" || { echo "Failed to create directory"; exit 1; }
                        echo "Directory created: $DIR_NAME (alias: $ALIAS_NAME)"
                    fi
                '''
            }
        }

        stage('Create File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/myfolder/hello.sh"

                    if [ -d "/home/administrator/myfolder" ]; then
                        echo '#!/bin/bash' > "$FILE_NAME"
                        echo 'echo Hello from MCET!' >> "$FILE_NAME"
                        echo "File created: $FILE_NAME"
                    else
                        echo "Directory not found, skipping file creation."
                        exit 1
                    fi
                '''
            }
        }

        stage('Execute File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/myfolder/hello.sh"

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

                    if [ -f "$FILE_NAME" ]; then
                        sudo chmod 755 "$DIR_NAME"
                        sudo chmod 744 "$FILE_NAME"
                        echo "Permissions updated:"
                        ls -l "$DIR_NAME"
                    else
                        echo "File not found, cannot change permissions."
                        exit 1
                    fi
                '''
            }
        }
    }
}
