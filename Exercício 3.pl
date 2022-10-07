open(ENTR,"<1HSG.pdb");
open(RESULT1,">>ATOMO.txt");
open(RESULT2,">>HIDROATOMO.txt");

my @atomx=0;
my @atomy=0;
my @atomz=0;
my @hatomx=0;
my @hatomy=0;
my @hatomz=0;
my $i=0;

	
#ATOM     18  CA  ILE A   3      29.123  33.098   3.397  1.00 34.13           C
  


while (my $line = <ENTR>)
{

	
	if ($line =~ /(ATOM)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		@atom[$i]=$1;
		@atomx[$i]=$13+$10;
		@atomy[$i]=$15+$10;
		@atomz[$i]=$17+$10;
		print RESULT1 "@atom[$i] @atomx[$i]  @atomy[$i]  @atomz[$i]\n ";		
		$i++;
	}
	
	if ($line =~ /(HETATM)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/)
	{
		@hatom[$i]=$1;
		@hatomx[$i]=$13;
		@hatomy[$i]=$15;
		@hatomz[$i]=$17;
		print RESULT2 "@hatom[$i] @hatomx[$i]  @hatomy[$i]  @hatomz[$i]\n ";		
		$i++;
	}
	
}