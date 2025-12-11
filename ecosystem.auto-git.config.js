module.exports = {
  apps: [
    {
      name: 'auto-git-push',
      script: '/root/MC-Server/auto_git_push_daemon.sh',
      cwd: '/root/MC-Server',
      interpreter: '/bin/bash',
      autorestart: true,
      watch: false,
      max_memory_restart: '9999M',
      error_file: '/root/MC-Server/logs/auto-git-push-error.log',
      out_file: '/root/MC-Server/logs/auto-git-push-out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss'
    }
  ]
};
