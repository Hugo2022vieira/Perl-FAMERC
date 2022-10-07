open(ENTRADA,"<1HSG.pdb");
open(RESULTADO1,">>ATOM.pdb");
open(RESULTADO2,">>HATOM.pdb");
open(LIGACAO,">>LIGACAO.txt");

my          @atomnome;
my		    @atomnumero;
my			@atomtipo;
my			@atomx;
my			@atomy;
my			@atomz;

my          @hatomnome;
my		    @hatomnumero;
my			@hatomtipo;
my			@hatomx;
my			@hatomy;
my			@hatomz;
my          $cont1 =0;
my          $cont2 =0;
my $i=0;
my $j=0;
my $dist1=0;
my $dist2=0;

while (my $line = <ENTRADA>)
{

	
	if ($line =~ /(ATOM)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
	
		@atomnome[$i]=$1;
		@atomnumero[$i]=$3;
		@atomtipo[$i]=$5;
		@atomx[$i]=$13;
		@atomy[$i]=$15;
		@atomz[$i]=$17;
		print  RESULTADO1 " @atomnome[$i]  @atomnumero[$i]  @atomtipo[$i]  @atomx[$i]  @atomy[$i]  @atomz[$i]\n ";
		$cont1++;
		$i++;
	}
	
	if ($line =~ /(HETATM)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
	
		@hatomnome[$j]=$1;
		@hatomnumero[$j]=$3;
		@hatomtipo[$j]=$5;
		@hatomx[$j]=$13;
		@hatomy[$j]=$15;
		@hatomz[$j]=$17;
		print  RESULTADO2 " @hatomnome[$i]  @hatomnumero[$i]  @hatomtipo[$i]  @hatomx[$i]  @hatomy[$i]  @hatomz[$i]\n ";
	    $cont2++;		
		$j++;
	}
	
	
}

#my $minimo=1000000000;


for($i=0;$i<$cont1;$i++)
{
	for($j=0;$j<$cont2;$j++)
	{
		 $dist1=(@atomx[$i]-@hatomx[$j])*(@atomx[$i]-@hatomx[$j]) + (@atomy[$i]-@hatomy[$j])*(@atomy[$i]-@hatomy[$j]) + (@atomz[$i]-@hatomz[$j])*(@atomz[$i]-@hatomz[$j]);
	     $dist2=sqrt($dist1);
		if($dist2<3.5)
		{
			print LIGACAO "@atomnumero[$i] @atomtipo[$i]   COM  @hatomnumero[$j]   @hatomtipo[$j]  DIST= $dist2 \n  ";
			
		}

	}
}

my $rasmol = "/rasmol/raswin ATOM.pdb";
system $rasmol;




