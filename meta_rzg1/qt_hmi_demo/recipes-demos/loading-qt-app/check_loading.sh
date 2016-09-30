#!/bin/bash

	pid_qt_launch_demo=$(pidof qmlscene)
	pid_qt_everywhere_demo=$(pidof QtDemo)
	pid_Loading=$(pidof Loading)
	pid_qt_cinematic_demo=$(pidof Qt5_CinematicExperience)
	pid_qt_qmlvideo=$(pidof qmlvideo)
	pid_qt_qmlvideofx=$(pidof qmlvideofx)
	pid_qt_webengine=$(pidof quicknanobrowser)

	Max=0
	result=0
	Get_only_one_pid_app(){
		local temp=$1
		local temp1=($temp)
		result=${temp1[0]}
		#echo "Result get only one pid: ${result}"
	}

	Max_pid_qt_app() {
		#echo "Get max Qt app"
		if [ "${pid_qt_launch_demo}" ] ; then
			Get_only_one_pid_app ${pid_qt_launch_demo}
			if [  "${Max}" -lt "${result}" ] ; then
				Max=${result}
				#echo "Max pid_qt_launch_demo: $Max"
			fi
		fi
		if [ "${pid_qt_everywhere_demo}" ]  ; then
			Get_only_one_pid_app ${pid_qt_everywhere_demo}
			if [  "${Max}" -lt "${result}" ] ; then
				Max=${result}
				#echo "Max pid_qt_everywhere_demo: $Max"
			fi
		fi
		if [ "${pid_qt_cinematic_demo}" ]  ; then
			Get_only_one_pid_app ${pid_qt_cinematic_demo}
			if [  "${Max}" -lt "${result}" ] ; then
				Max=${result}
				#echo "Max pid_qt_cinematic_demo: $Max"
			fi
		fi
		if [ "${pid_qt_qmlvideo}" ]  ; then
			Get_only_one_pid_app ${pid_qt_qmlvideo}
			if [  "${Max}" -lt "${result}" ] ; then
				Max=${result}
				#echo "Max pid_qt_qmlvideo: $Max"
			fi
		fi
		if [ "${pid_qt_qmlvideofx}" ]  ; then
			Get_only_one_pid_app ${pid_qt_qmlvideofx}
			if [  "${Max}" -lt "${result}" ] ; then
				Max=${result}
				#echo "Max pid_qt_qmlvideofx: $Max"
			fi
		fi
		if [ "${pid_qt_webengine}" ]  ; then
			Get_only_one_pid_app ${pid_qt_webengine}
			if [  "${Max}" -lt "${result}" ] ; then
				Max=${result}
				#echo "Max pid_qt_webengine: $Max"
			fi
		fi
	}

running_app(){
	if  [ "${pid_qt_launch_demo}" ] || [ "${pid_qt_everywhere_demo}" ] || [ "${pid_qt_cinematic_demo}" ]  || [ "${pid_qt_qmlvideo}" ]  || [ "${pid_qt_qmlvideofx}" ] || [ "${pid_qt_webengine}" ]  ; then
		#echo "Exist qt-app"
		#Get max pid Qt app
		Max_pid_qt_app

		#Get pid of newest Loading app
		while [ "${pid_Loading}" -gt 1 ] ; do  # Loading is calling
			#echo "Exist Loading app"
			#echo "pid Loading : ${pid_Loading}"
			check=(${pid_Loading})
			check1=($check)
			Get_only_one_pid_app ${pid_Loading}
			pid_loading_app=${result}
			#echo "Max pid loading app: $pid_loading_app "
			#echo "--------------------"

			#Compare pid loading app and qt app
			if [ ${pid_loading_app} -lt ${Max} ] ; then # app is calling
				#echo "pid loading app less than max  pid Qt app:  ${pid_loading_app} -lt ${Max}"
				#echo "killall loading app ${pid_loading_app}"
				#kill 	${check1[0]}
				killall Loading
			else
				#echo "pid loading app large than max  pid Qt app"
				killall Loading
			fi
            pid_Loading=$(pidof Loading)
            #echo " --------------- ${pid_Loading}"

		 done
	fi
}

running_app
