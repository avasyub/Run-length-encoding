pkg load image
pkg load communications

filename = "rleop.txt";
fid = fopen (filename, "w");
img = imread("testimgrgb.jpg");
#imshow(img);
level = graythresh(img);
bw=im2bw(img,level);
#figure, imshow(bw);
bw

[m,n]=size(bw);

rle = cell(m,1);
row =[];

for i = 1:m
  c = 0;
  for j = 1:n-1
    if bw(i,j)==bw(i,j+1)
      c = c+1;
    else
      #bw(i,j) #print current bit
      #c = c+1 #print count
      row = rle{i};
      row = [row bw(i,j)];
      count = de2bi(c+1,7,'left-msb');
      row = [row count];
      rle{i} = row;
      #fprintf (fid,"%d" , rle{i});
      #fprintf (fid,'\n');
      c = 0;
     end
  end
  #bw(i,j) #print current bit
  #c = c+1 #print count
  row = rle{i};
  row = [row bw(i,j)];
  count = de2bi(c+1,7,'left-msb');
  row = [row count];
  rle{i} = row;
  fprintf (fid,"%d" , rle{i});
  fprintf (fid,'\n');
end

rle
fclose (fid);





















