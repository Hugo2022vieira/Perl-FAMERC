use strict;
use warnings;

package Node;

sub new {
    my ($class, $chave) = @_;
    my $self = {
        chave => $chave,
        altura => 0,  # Assuming initial height is 0
        esq => undef,
        dir => undef,
    };
    bless $self, $class;
    return $self;
}

package main;

sub buscabinaria {
    my ($x, $pt) = @_;
    if (not defined $pt) {
        return 0;
    } elsif ($x == $pt->{chave}) {
        return 1;
    } elsif ($x < $pt->{chave}) {
        return buscabinaria($x, $pt->{esq});
    } else {
        return buscabinaria($x, $pt->{dir});
    }
}

sub inserenodo {
    my ($x, $ptraiz) = @_;
    my $res = buscabinaria($x, $ptraiz);
    if ($res == 1) {
        print "\nInsercao invalida: $x\n";
        return 0;
    } else {
        my $ptnovo = Node->new($x);
        if ($res == 0) {
            $ptraiz = $ptnovo;
        } elsif ($res == 2) {
            $ptraiz->{esq} = $ptnovo;
        } else {
            $ptraiz->{dir} = $ptnovo;
        }
        return 1;
    }
}

my $MAX = 100000;
my @a = ();
my $n = 0;
my $t_i = time();
my $arvore = undef;

open my $file, "<", "lista.txt" or die "Erro ao abrir arquivo: $!";
while (my $i < $MAX) {
    $i++;
    chomp(my $linha = <$file>);
    push @a, $linha;
}
close $file;

print "Comecando a coroa...\n";

for my $x (@a) {
    inserenodo($x, \$arvore);
    $n++ if inserenodo($x, \$arvore) == 1;
}

my $t_f = time();
print "Levou ", $t_f - $t_i, " segundos para inserir ", $n, " elementos\n";
