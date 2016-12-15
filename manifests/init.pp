class vim (
  # Class parameters are populated from module hiera data
  String $root_group,
){
    #$root_group = hiera( "root_group" )
    case $::osfamily {
        'Suse': {
            $vimrc = '/etc/vimrc'
            $vim_site_dir = [ '/usr/share/vim/', '/usr/share/vim/site/', '/usr/share/vim/site/syntax/']
            $vimpupsyn = '/usr/share/vim/site/syntax/puppet.vim'
            $vimtt2syn = '/usr/share/vim/site/syntax/tt2.vim'
            $vimtt2htmlsyn = '/usr/share/vim/site/syntax/tt2html.vim'
        }
        'RedHat', 'Centos': {
            $vimrc = '/etc/vimrc'
            $vim_site_dir = [ '/usr/share/vim/', '/usr/share/vim/site/', '/usr/share/vim/site/syntax/']
            $vimpupsyn = '/usr/share/vim/site/syntax/puppet.vim'
            $vimtt2syn = '/usr/share/vim/site/syntax/tt2.vim'
            $vimtt2htmlsyn = '/usr/share/vim/site/syntax/tt2html.vim'
        }
        'Darwin': {
            $vimrc = '/usr/share/vim/vimrc'
            $vim_site_dir = [ '/usr/share/vim/', '/usr/share/vim/vim73/', '/usr/share/vim/vim73/syntax/']
            $vimpupsyn = '/usr/share/vim/vim73/syntax/puppet.vim'
            $vimtt2syn = '/usr/share/vim/vim73/syntax/tt2.vim'
            $vimtt2htmlsyn = '/usr/share/vim/vim73/syntax/tt2html.vim'
        }
        'Debian': {
            $vimrc = '/etc/vimrc'
            $vim_site_dir = [ '/usr/share/vim/', '/usr/share/vim/site/', '/usr/share/vim/site/syntax/']
            $vimpupsyn = '/usr/share/vim/site/syntax/puppet.vim'
            $vimtt2syn = '/usr/share/vim/site/syntax/tt2.vim'
            $vimtt2htmlsyn = '/usr/share/vim/site/syntax/tt2html.vim'
        }
        default: {
            fail("This module is note designed for ${::osfamily}")
        }
    }
    file { $vim_site_dir:
          ensure  => directory,
          owner    => 'root',
          group   => $root_group,
          mode    => '0755',
    }
    file { $vimrc:
          ensure  => file,
          mode    => '0644',
          source  => "puppet:///modules/vim/vimrc",
    }
    file { $vimtt2htmlsyn:
          ensure  => file,
          mode    => '0644',
          source  => "puppet:///modules/vim/tt2html.vim",
    }
    file { $vimtt2syn:
          ensure  => file,
          mode    => '0644',
          source  => "puppet:///modules/vim/tt2.vim",
    }
    file { $vimpupsyn:
          ensure  => file,
          mode    => '0644',
          source  => "puppet:///modules/vim/puppet.vim",
    }

}
