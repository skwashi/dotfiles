# ~/.profile

# Fallback PATH for non-systemd sessions
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH

# Load systemd environment.d variables for greetd/Wayland sessions
if [ -x /usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator ]; then
  set -o allexport
  source <(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
  set +o allexport
fi
