# pre-commit-docker
A Docker image that runs pre-commits on your code.

# Install
```bash
curl https://gist.githubusercontent.com/philipdelorenzo/8628b76fc442fb4027dc0c0bb72c4922/raw/e6f4ff90e791d2ba5308b36c5d50d8a6449c8980/pre-commit-installer.sh -o pre-commit-installer.sh && bash pre-commit-installer.sh && rm pre-commit-installer.sh
```

# Remove Githook
```bash
git config --unset core.hooksPath
```

# Re-add Githook
```bash
git config core.hooksPath .githooks
```
