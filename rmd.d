import std.file;
import std.stdio;
import std.algorithm;

void main(string[] args){
	
	auto dir = "";
	bool verbose = false;
	
	if(args.length == 1 || startsWith(args[1], "-h") || startsWith(args[1], "--help")){
		printHelp();
		return;
	}
	else if(startsWith(args[1], "-v") || startsWith(args[1], "--verbose")){ 
		if(args.length != 3){
			writeln("No directory provided");
			return;
		}
		verbose = true;
		dir = args[2];
	}
	else {
		dir = args[1];
	}

	if (dir.exists){
		if(dir.isDir){
			if(verbose){
				foreach (string name; dirEntries(dir, SpanMode.depth)){
					remove(name);
					writeln("Deleted " ~ name);
				}
				remove(dir);
				writeln("Deleted " ~ dir);
			}
			else{
				dir.rmdirRecurse;
			}
		}
		else{
			writeln(dir ~ " is not a directory");
		}
	}
	else {
		writeln("Unable to find " ~ dir);
	}
}

void printHelp(){
	writeln("Usage: rmd [OPTION] directory");
	writeln();
	writeln("-v, --verbose\toutput the file and/or directory being deleted");
	writeln("-h, --help   \tprint help");
}
