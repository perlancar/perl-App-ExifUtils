package App::ExifUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{exifshow} = {
    v => 1.1,
    summary => 'Show EXIF information in a file',
    args => {
        filename => {
            schema => 'filename*', # XXX filename*?
            pos => 0,
            req => 1,
        },
    },
};
sub exifshow {
    require Image::ExifTool;

    my %args = @_;
    my $filename = $args{filename};

    return [404, "No such file '$filename'"] unless -f $filename;
    my $info = Image::ExifTool::ImageInfo($filename);
    [200, "OK", $info];
}

1;
#ABSTRACT: Utilities related to EXIF

=head1 DESCRIPTION

This distributions provides the following command-line utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

=cut
