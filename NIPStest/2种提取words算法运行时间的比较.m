@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
tic
%���������е�docs_names
load('NIPS04~14.mat')
%��ν�docs_names�ͺ�׺���ϲ�
fname=strcat(docs_names,'.txt');
%����1����������ȡtxt�ĵ���words
A=[];
for i=1:2
    text=[];
    fid=fopen(fname{i});
    text=fscanf(fid,'%c');
    A=[A,text];
end
fclose('all');
str='[a-zA-Z]+';
words=regexpi(A,str,'match');
toc
ʱ���ѹ� 0.072132 �롣

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
tic
%���������е�docs_names
load('NIPS04~14.mat')
%��ν�docs_names�ͺ�׺���ϲ�
fname=strcat(docs_names,'.txt');
%����2����������ȡtxt�ĵ���words
for i=1:2
    fid=fopen(fname{i});
    while 1
    tline=fgets(fid);
    if ~ischar(tline)
        break;
    end
    text=[text,tline];
    end
end
fclose('all');
str='[a-zA-Z]+';
words=regexpi(text,str,'match');
toc
ʱ���ѹ� 0.121152 �롣
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@