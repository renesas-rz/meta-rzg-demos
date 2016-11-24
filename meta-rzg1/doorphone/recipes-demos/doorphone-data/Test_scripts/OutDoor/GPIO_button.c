#include <stdint.h>
#include <linux/version.h>
#include <linux/input.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int main(){
	int fd,rd;
	fd = open("/dev/input/event0", "r");
	struct input_event ev[2];
	
	while(1){
		rd = read(fd, ev, sizeof(struct input_event) * 2);
		if((int)ev[0].value == 1){
			system("cp /home/root/doorphone/image_capture.jpeg /home/root/doorphone/image.jpeg");
			system("cp /home/root/doorphone/image_capture.jpeg /home/root/doorphone/image.jpeg");
			system("/home/root/doorphone/loop_script.sh");
		}
	}
	return 0;
}
