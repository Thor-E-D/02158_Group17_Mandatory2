//Prototype implementation of Field class
//Mandatory assignment 2
//Course 02158 Concurrent Programming, DTU, Fall 2021

//Hans Henrik Lovengreen     Sep 29, 2021

public class Field {

    Semaphore[][] semaphores = new Semaphore[Layout.ROWS][Layout.COLS];

    public Field() {
        //Instantiate a semaphore for each tile to ensure only one car is on a tile at a time.
        for (int i = 0; i < Layout.ROWS; i++) {
            for (int j = 0; j < Layout.COLS; j++) {
                semaphores[i][j] = new Semaphore(1);
            }
        }
    }

    /* Block until car no. may safely enter tile at pos */
    public void enter(int no, Pos pos) throws InterruptedException {
        semaphores[pos.row][pos.col].P(); //Pick up coconut or wait for it.
    }

    /* Release tile at position pos */
    public void leave(Pos pos) {
        semaphores[pos.row][pos.col].V(); //throw coconut back
    }

}
