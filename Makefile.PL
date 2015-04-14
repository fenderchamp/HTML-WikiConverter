use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::WikiConverter',
    AUTHOR              => 'David J. Iberri <diberri@cpan.org>',
    LICENSE             => 'perl',
    VERSION_FROM        => 'lib/HTML/WikiConverter.pm',
    ABSTRACT_FROM       => 'lib/HTML/WikiConverter.pm',
    PL_FILES            => {},
    EXE_FILES           => [ 'bin/html2wiki' ],
    PREREQ_PM => {
        'Test::More'         => 0,
        'Test::HTTP::Server' => 0,
        'CGI::Application'   => 0,
        'HTML::Tree'         => 3.18,
        'HTML::Element'      => 0,
        'CSS'                => 1.07, # (bug #20594)
        'URI'                => 1.35,
        'URI::Escape'        => 0,
        'HTML::Entities'     => 1.27,
        'HTML::Tagset'       => 3.04,
        'Params::Validate'   => 0.77,
        'Class::Data::Inheritable' => 0.02,
        'Test::Pod::Coverage'      => 1.04,
        'Pod::Usage'         => 1.16,
        'Test::Pod'          => 1.14,
        'Exporter'           => 0,
        'Carp'               => 0,
        'XML::Writer'        => 0
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTML-WikiConverter-*' },
);
  sub MY::postamble {
        return <<'MAKE_FRAG';

AUTHOR_TEST_FILES = xt/*.t

author_test :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness($(TEST_VERBOSE), '$(INST_LIB)', '$(INST_ARCHLIB)')" $(AUTHOR_TEST_FILES)
MAKE_FRAG
} 
