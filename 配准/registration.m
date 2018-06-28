for i = 0:23
    if i<10
        moving = imread(['ct/image000',num2str(i),'.bmp']);
    else
        moving = imread(['ct/image00',num2str(i),'.bmp']);
    end   
     
    if i<10
        fixed = imread(['ct/image000',num2str(i),'.bmp']);
    else
        fixed = imread(['ct/image00',num2str(i),'.bmp']);
    end
    %moving = rgb2gray(moving);
    %fixed = rgb2gray(fixed);
    [optimizer, metric] = imregconfig('multimodal');
    optimizer.GrowthFactor = 1.01;  
    optimizer.Epsilon = 1.5e-6;  
    optimizer.InitialRadius = 0.001;  
    optimizer.MaximumIterations = 5000;  
    registered = imregister(moving,fixed,'affine',optimizer,metric);
    %figure();
    %imshowpair(registered,fixed);
    imwrite(registered,['ct_r/img',num2str(i),'.png'],'png')
end

