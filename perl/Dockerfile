from devboxbase:latest

label com.sas.it.perl=1
#RUN curl -L http://snaps.unx.sas.com/pub/CPAN/cpanmin.pl | perl - App::cpanminus && \
RUN curl -L https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm | perl - App::cpanminus && \
  cpanm --mirror http://mirrors.ibiblio.org/CPAN/ --mirror-only --notest \
  App::cpanminus \
  Data::Dumper \
  Test::Most \
  Regexp::Common::Email::Address \
  Class::Unload \
  Data::Printer \
  DateTime \
  DBIx::Connector \
  Mojolicious \
  Mojolicious::Plugin::YamlConfig \
  MojoX::Log::Log4perl \
  Net::STOMP::Client \
  DBI DBD::mysql \
  JSON \
  JSON::XS \
  Log::Log4perl \
  MIME::Base64 \
  Moose \
  namespace::autoclean \
  Net::LDAP \
  Net::OpenSSH \
  Proc::Daemon \
  Readonly \
  Regexp::Common \
  REST::Client \
  String::Random \
  Try::Tiny \
  Unicode::Map8 \
  XML::Simple \
  YAML
