open(ENTRADA,"<1HSG.pdb");

open(DISTANCIA,">>DISTANCIA_EUC.txt");


	my @vetor_atomo01;
	my @vetor_atomo02;
	my @vetor_atomo03;
	my @vetor_atomo04;
	my @vetor_hetatm01;
	my @vetor_hetatm02;
	my @vetor_hetatm03;
	my @vetor_hetatm04;
	my @dist1 = 0;
	my @dist2 = 0;
	my @conta1 = 0;
	my @conta2 = 0;
	my $i=0;
	my $j=0;


while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(\s+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		
		@vetor_atomo01[$i] = $1;
		@vetor_atomo02[$i] = $13;
		@vetor_atomo03[$i] = $15;
		@vetor_atomo04[$i] = $17;
		$conta1++;
		
		
		$i++;
	}
	
	if ($line =~ /(\s+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		
		@vetor_hetatm01[$j] = $1;
		@vetor_hetatm02[$j] = $13;
		@vetor_hetatm03[$j] = $15;
		@vetor_hetatm04[$j] = $17;
		$conta2++;
		
		
		$j++;
	}
}

for($i=0;$i<$conta1;$i++)
{
  for($j=0;$j<$conta2;$j++)
  {
    $dist1 = (@vetor_atomo02[$i]-@vetor_hetatm02[$j])*(@vetor_atomo02[$i]-@vetor_hetatm02[$j])+
			 (@vetor_atomo03[$i]-@vetor_hetatm03[$j])*(@vetor_atomo03[$i]-@vetor_hetatm03[$j])+
			 (@vetor_atomo04[$i]-@vetor_hetatm04[$j])*(@vetor_atomo04[$i]-@vetor_hetatm04[$j]);


    if ($dist1<= 3.5 )
	{
	  $dist2 = sqrt($dist1);
	  
	  print DISTANCIA " Ligações formadas-->Distancia Euclidiana = $dist2  @vetor_atomo01[$i] = @vetor_atomo02[$i] @vetor_atomo03[$i] @vetor_atomo04[$i] @vetor_hetatm01[$j] = @vetor_hetatm02[$j] @vetor_hetatm03[$j] @vetor_hetatm04[$j]\n";	
	}
	
	
  
  }



}

