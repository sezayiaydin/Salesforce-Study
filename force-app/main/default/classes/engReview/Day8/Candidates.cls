public class Candidates {
    public string name;
    public string gender;
    public static string companyName;
    public static integer candidateCount = 0;

    public Candidates(){
        System.debug('constructor called.');
        candidateCount++;
    }

    public void printCandidate() {
        system.debug('candidate name is ' + name);
        system.debug('gender is ' + gender);
        system.debug('company name is ' + companyName);
        system.debug('====END====');
    }

    public static void printCandidateInfo(){
        System.debug('Company name is '+ companyName);
    }
}