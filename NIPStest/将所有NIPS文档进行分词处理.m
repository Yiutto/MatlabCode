%1.AllTextNames.txt�а��������ĵ�������
text_names=textread('AllTextNames.txt','%s');
%����ĵ���׺��
fname=strcat(text_names,'.txt');
for i=1:length(fname)
    fid1=fopen(fname{i},'r');
    text=[];
    while 1
        tline=fgetl(fid1);
        if ~ischar(tline)
            break;
        end
        text=[text,tline];
        %��Ϊ��ӿհ׷ָ���
        text=[text,' '];
    end
    fclose(fid1);
    %strrep(str1,str2,str3)����str1�����е�str2�ִ���str3���滻
    text=strrep(text,'- ','');
    %2.ͨ��������ʽ����ĵ��е�Ӣ�ĵ���
    str='[a-zA-Z]+';
    word=regexpi(text,str,'match');
    %���Abstract��λ��,���ĵ���ͷ��Abstract����ɾ��
    Abs_idex=find(cellfun(@(x) strcmp(x,'Abstract'),word));
    word(1:Abs_idex)=[];
    %���References��λ��,��References���ĵ�ĩβ����ɾ��
    Ref_idex=find(cellfun(@(y) strcmp(y,'References'),word));
    word(Ref_idex:end)=[];
    %3����ˢ��д��word�е�cell���鵽ԭ�ĵ���
    fid2=fopen(fname{i},'w+');
    for j=1:length(word)
        fprintf(fid2,'%s',word{j});
        fprintf(fid2,' ');
    end
    fclose(fid2);
end
fprintf('����%dƪtxt�ĵ��ִ���ϣ�',length(fname));
    