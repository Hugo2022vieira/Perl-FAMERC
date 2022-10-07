open(ENTRADA,"<1HSG.pdb");

open(TRANS,">>TRANSLADADO.txt");



	my @vetor01;
	my @vetor02;
	my @vetor03;
	my @vetor04;

#ATOM     18  CA  ILE A   3      29.123  33.098   3.397  1.00 34.13           C 
while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		@vetor01[$i] = $1;
		@vetor02[$i] = $13+0.5;
		@vetor03[$i] = $15+0.5;
		@vetor04[$i] = $17+0.5;
		
		
		print TRANS "  @vetor01[$i] @vetor02[$i] @vetor03[$i] @vetor04[$i]\n";	
	
	}
	
	
}



