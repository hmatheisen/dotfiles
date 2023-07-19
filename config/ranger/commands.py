from ranger.api.commands import Command

class fzf_select(Command):
    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument to select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os
        from ranger.ext.get_executables import get_executables

        hidden = ('--hidden' if self.fm.settings.show_hidden else '')
        exclude = "--no-ignore-vcs --exclude '.git' --exclude '*.py[co]' --exclude '__pycache__'"
        only_directories = ('--type directory' if self.quantifier else '')
        fzf_default_command = 'fd --follow {} {} {} --color=always'.format(hidden, exclude, only_directories)

        env = os.environ.copy()
        env['FZF_DEFAULT_COMMAND'] = fzf_default_command
        env['FZF_DEFAULT_OPTS'] = '--height=50% --layout=reverse --ansi --preview="bat -n --color=always {}"'

        fzf = self.fm.execute_command('fzf --no-multi', env=env, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            selected = os.path.abspath(stdout.strip())
            if os.path.isdir(selected):
                self.fm.cd(selected)
            else:
                self.fm.select_file(selected)
