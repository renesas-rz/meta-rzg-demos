#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>
#include <fcntl.h>

#include <gst/gst.h>

#include <stdint.h>
#include <linux/version.h>
#include <linux/input.h>
#include <unistd.h>

int num_save = 0;
GstElement *pipeline;
int flag = 0;

gboolean busHandler(GstBus *bus, GstMessage *msg, gpointer data){
	gboolean ret = TRUE;
	gboolean result = FALSE;
	const gchar *name = "GstMultiFileSink";
	GMainLoop *loop = (GMainLoop *) data;
	//GMainLoop *loop = (GMainLoop *) data;
	guint32 num;
    num = gst_message_get_seqnum(msg);
	result = gst_message_has_name(msg,name); // if TRUE: multifilesink event
	char *signal=NULL;
	signal = GST_MESSAGE_TYPE_NAME(msg);
	
	// Check facedetect event (type = "element")
	if(((char)signal[0]== 'e') && ((char)signal[6]== 't') && (result == FALSE)){
		if((num - num_save) > 5){
			flag = 1;
		}
		num_save = num;
	} 
	
	if(result == TRUE){
		if(flag == 1){
			system("cp /home/root/doorphone/image_capture.jpeg /home/root/doorphone/image.jpeg");
			system("/home/root/doorphone/loop_script.sh face_detect");
			flag = 0;
		}
	}
	
	return ret;
}


int main(int argc, char *argv[]){
//int main(){

	//GstElement *pipeline;
	GstElement *pipeline2,*src,*depay,*parse,*decode,*vrate,*jenc,*sink,*vratecap;
	
	GstBus *bus = NULL;
	GstBus *bus2 = NULL;
	GError *error = NULL;
	GError *error2 = NULL;
	GMainLoop *loop;
	GMainLoop *loop2;
	GstCaps *srccap,*caprate;
		
	gst_init(&argc, &argv);
	loop = g_main_loop_new (NULL, FALSE);
	
	
	GstStateChangeReturn ret;
	//create pipeline & link
	pipeline = gst_parse_launchv((const gchar**)&argv[1], &error);
		
	bus = gst_pipeline_get_bus(GST_PIPELINE(pipeline));
	gst_bus_add_watch(bus, busHandler, loop);
	gst_object_unref(bus);
		
	ret = gst_element_set_state (pipeline, GST_STATE_PLAYING);
	
	g_main_loop_run (loop);
	return 0;
}

