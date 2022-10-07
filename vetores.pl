open(ENTRADA,"<1HSG.pdb");

open(SAIDA,">>ATOM.txt");
open(SAIDA2,">>HETATM.txt");

	my @vetor_atomo01;
	my @vetor_atomo02;
	my @vetor_atomo03;
	my @vetor_atomo04;
	my @vetor_hetatm01;
	my @vetor_hetatm02;
	my @vetor_hetatm03;
	my @vetor_hetatm04;
	my $i=0;
	my $j=0;
	
#ATOM     18  CA  ILE A   3      29.123  33.098   3.397  1.00 34.13           C  
#HETATM 1517  N1  MK1 B 902       9.280  23.763   3.004  1.00 28.25           N

while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(ATOM)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		
		@vetor_atomo01[$i] = $1;
		@vetor_atomo02[$i] = $13;
		@vetor_atomo03[$i] = $15;
		@vetor_atomo04[$i] = $17;
		
		print SAIDA " @vetor_atomo01[$i] @vetor_atomo02[$i] @vetor_atomo03[$i] @vetor_atomo04[$i]\n" ;
		
		$i++;
	}
	
	if ($line =~ /(HETATM)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		@vetor_hetatm01[$j] = $1;
		@vetor_hetatm02[$j] = $13;
		@vetor_hetatm03[$j] = $15;
		@vetor_hetatm04[$j] = $17;
		
		print SAIDA2 " @vetor_hetatm01[$j] @vetor_hetatm02[$j] @vetor_hetatm03[$j] @vetor_hetatm04[$j]\n" ;
		
		$j++;
	}
}
