/**
 * TYTLGVM
 *
 * Twenty Years Too Late Game Virtual Machine
 */

#include <sys/time.h>
#include <time.h>

namespace GVM {

    class FloatClock {
    private:
        static struct timezone  tz;
        timeval mark;

    public:
        void set() {
            gettimeofday(&mark, &tz);
        }

        float32 elapsed();

    public:
        FloatClock() {
            set();
        }
    };

}

