#!/bin/sh

face_detect()
{
if [ -r /home/root/doorphone/image.jpeg ]; then
    # Copy image to Basephone
    cat /home/root/doorphone/image.jpeg | ssh -y root@192.168.10.100 'cat > /home/root/doorphone/image.jpeg'

    # Tell Basephone to display face detect icon
    ssh -y root@192.168.10.100 'rm /home/root/doorphone/show_icon_flag' &> /dev/null
    ssh -y root@192.168.10.100 '> /home/root/doorphone/show_icon_flag'

    # Tell Basephone to send email
    ssh -y root@192.168.10.100 'mailx -A its -s DOORPHONE -a /home/root/doorphone/image.jpeg `cat /mail_list.txt` < /home/root/doorphone/mail' &
    echo "*************mail sent************"

    rm /home/root/doorphone/image.jpeg
fi
}

GPIO_button()
{
if [ -r /home/root/doorphone/image.jpeg ]; then
    # Copy image to Basephone
    cat /home/root/doorphone/image.jpeg | ssh -y root@192.168.10.100 'cat > /home/root/doorphone/image.jpeg'

    # Tell Basephone to send email
    ssh -y root@192.168.10.100 'mailx -A its -s DOORPHONE -a /home/root/doorphone/image.jpeg `cat /mail_list.txt` < /home/root/doorphone/mail' &
    echo "*************mail sent************"

    rm /home/root/doorphone/image.jpeg
fi
}

main()
{
if [ $1 = "face_detect" ] ; then
    face_detect
else
	GPIO_button
fi
}

main $1

