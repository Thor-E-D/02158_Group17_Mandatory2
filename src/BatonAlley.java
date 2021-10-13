//Skeleton implementation of an Alley class  using passing-the-baton
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2021

//Hans Henrik Lovengreen     Sep 29, 2021

public class BatonAlley extends Alley {

    int up, down;
    Semaphore upSem, downSem, entry;

    protected BatonAlley() {
        up = 0; down = 0;

        upSem   = new Semaphore(0);
        downSem = new Semaphore(0);
        entry   = new Semaphore(1);
    }

    /* Block until car no. may enter alley */
    public void enter(int no) throws InterruptedException {
        if (no < 5) {
            entry.P();
            if (up > 0 ){
                down++;
                entry.V();
                downSem.P();
            }
            down ++;
            signal();
            
        } else {
            entry.P();
            if (down > 0){
                up++;
                entry.V();
                upSem.P();
            }
            up++;
            signal();
        }

     }

    private void signal() {
        if(up == 0 && down > 0){
            down--;
            downSem.V();
        } else if (down == 0 && up > 0){
            up--;
            upSem.V();
        } else{
            entry.V();
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
            signal();
        } else {
            try {
                entry.P();
            } catch (InterruptedException e) {
                System.out.println("shit went wrong, yo!");
                e.printStackTrace();
            }
            up--;
            signal();
        }
    }

}
