# **Infisical-Backup**

**Backup And Restore Solution With Bash Script**

(Note: This script works with the Dockerized version and can be installed from [Infisical GitHub Repository](https://github.com/Infisical/infisical/tree/main).)

**Backup Script**

1. First, clone the project:

   ```
   git clone https://github.com/AshkanSabouri/infisical-backup.git
   ```

2. Next, set execute permissions for the scripts:

   ```
   sudo chmod +x backup.sh restore.sh
   ```

3. Then, run the backup script (this script creates three directories named `db`, `backend`, and `redis`, and saves the backup in them):

   ```
   ./backup.sh
   ```

**Restore Script**

1. First, you need to edit the script to specify the backup date you want to restore:

   ```
   sudo vi restore.sh
   ```

   Edit the `BACKUP_DATE` value to the exact time of the backup created by the backup script.

   Example: `BACKUP_DATE="20240519053001"`

2. Then, run the script:

   ```
   ./restore.sh
   ```