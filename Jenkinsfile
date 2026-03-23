pipeline {
    agent any

    stages {
        stage('Check/Create Directory') {
            steps {
                sh '''
                    #!/bin/bash
                    DIR_NAME="/home/administrator/mcet"
                    ALIAS_NAME="MCET"

                    if [ ! -d "$DIR_NAME" ]; then
                        sudo mkdir -p "$DIR_NAME" || { echo "Failed to create directory"; exit 1; }
                        echo "Directory created: $DIR_NAME (alias: $ALIAS_NAME)"
                    else
                        echo "Directory already exists: $DIR_NAME (alias: $ALIAS_NAME)"
                    fi
                '''
            }
        }

        stage('Create File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/mcet/hello.sh"
                    DIR_NAME="/home/administrator/mcet"

                    if [ -d "$DIR_NAME" ]; then
                        echo '#!/bin/bash' | sudo tee "$FILE_NAME" > /dev/null
                        echo 'echo Hello from MCET!' | sudo tee -a "$FILE_NAME" > /dev/null
                        sudo chmod +x "$FILE_NAME"
                        echo "File created: $FILE_NAME"
                    else
                        echo "Directory not found: $DIR_NAME"
                        exit 1
                    fi
                '''
            }
        }

        stage('Execute File') {
            steps {
                sh '''
                    #!/bin/bash
                    FILE_NAME="/home/administrator/mcet/hello.sh"

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
                    DIR_NAME="/home/administrator/mcet"
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
