# Porkins

A New Republic Fifth Fleet Asteroids-style game

## Install
1. Install Ruby
    1. Linux
        1. Consult your owner's manual
    1. MacOS
        1. Use Homebrew to install rbenv, run in the Terminal: `brew install rbenv ruby-build`
        1. Add rbenv to your Terminal profile: `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
        1. Close and reopen your Terminal to ensure rbenv is available
        1. Use rbenv to install Ruby: `rbenv install 3.1.2`
        1. Set your default Ruby version: `rbenv global 3.1.2`
        1. To verify the installation, run `ruby -e "puts 'Hello Ruby'"` and "Hello Ruby" should be printed in your Terminal
    1. Windows
        1. Download the latest "With DevKit" x64 version of Ruby from https://rubyinstaller.org/downloads/
        1. Run the installer as an administrator and accept all the default options
        1. A Command Prompt window will open at the end of the installation, press Enter to install everything that's needed. When it's finished, press Enter again to quit.
        1. Open a new Command Prompt window and run `ruby -e "puts 'Hello Ruby'"` and "Hello Ruby" should be printed in your Command Prompt
1. Download Porkins
    1. Download or clone from https://github.com/nr5f/porkins
1. Install dependencies
    1. Linux
        1. Install Simple DirectMedia Layer: https://www.libsdl.org
        1. Change directories into the porkins folder, e.g., `cd ~/porkins`
        1. Install the ruby2d dependency: `bundle install`
    1. MacOS
        1. In Terminal, change directories into the porkins folder, e.g., `cd ~/porkins`
        1. Install the ruby2d dependency: `bundle install`
    1. Windows
        1. In Command Prompt, change directories into the porkins folder, e.g., `cd ~/porkins`
        1. Install the ruby2d dependency: `bundle install`

## Run
1. Within the porkins directory, run: `bundle exec ruby porkins.rb`
