//Skeleton implementation of an Alley class  using passing-the-baton
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2021

//Hans Henrik Lovengreen     Sep 29, 2021

public class BatonAlley extends Alley {

    int up, down, dup, ddown;
    Semaphore upSem, downSem, entry;

    protected BatonAlley() {
        up = 0; down = 0;
        dup = 0; ddown = 0;

        upSem   = new Semaphore(0);
        downSem = new Semaphore(0);
        entry   = new Semaphore(1);
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException {
        if (no < 5) {
            entry.P();
            if (up > 0 ){
                ddown++;
                entry.V();
                downSem.P();
            }
            down ++;
            if(ddown > 0){
                ddown--;
                downSem.V();
            } else {
                entry.V();
            }
            
        } else {
            entry.P();
            if (down > 0){
                dup++;
                entry.V();
                upSem.P();
            }
            up++;
            if(dup > 0){
                dup--;
                upSem.V();
            } else {
                entry.V();
            }
        }

     }

    /* Register that car no. has left the alley */
    public void leave(int no) {
        if (no < 5) {
            try {
                entry.P();
            } catch (InterruptedException e) {
                System.out.println("shit went wrong, yo!");
                e.printStackTrace();
            }
            down--;
            if (down == 0 && dup > 0){
                dup--;
                upSem.V();
            } else {
                entry.V();
            }


        } else {
            try {
                entry.P();
            } catch (InterruptedException e) {
                System.out.println("shit went wrong, yo!");
                e.printStackTrace();
            }
            up--;
            if(up == 0 && ddown > 0){
                ddown--;
                downSem.V();
            } else {
                entry.V();
            }
        }
    }

}
