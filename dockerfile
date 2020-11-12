FROM ubuntu:latest 
RUN apt-get -y update && apt-get install -y \
	libsm6 \
	libxext6 \
	libxrender-dev \
	libglib2.0-0 \
	wget
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh && \
sh /opt/Anaconda3-2020.07-Linux-x86_64.sh -b -p /opt/anaconda3 && \
rm -f Anaconda3-2020.07-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip && pip install \
 	opencv-python \
 	nibabel
WORKDIR /work
 CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
