# puppet-vim
Puppet module to manage system wide settings and plugins for vim.

For OSX, it assumes MacPorts is configured.

## Instructions
T.B.A.

## Issues
This module is using hiera data that is embedded in the module rather than using a params class.  This may not play nicely with other modules using the same technique unless you are using hiera 3.0.6 and above (PE 2015.3.2+).
