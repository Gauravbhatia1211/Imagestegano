figlet -f big  Imagestegano
echo -e "\t#************************************************#"
echo -e "\t#                                                #"
echo -e "\t#                  written by                    #"
echo -e "\t#                 Gaurav Bhatia                  #"
echo -e "\t#                April 05, 2021                  #"
echo -e "\t#                                                #"
echo -e "\t#                                                #"
echo -e "\t#************************************************#"
echo ""
PS3='Please enter your choice: '
options=("Encrypt" "Decrypt" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Encrypt")
       echo ""
 echo  "enter path of any image in which you have to hide your sensitive information : " 
        read img_path
echo""
        echo  "enter the path of sensitive file or folder that you wanna encrypt : " 
        read file_path
echo""      
  echo "enter any name for your encrypted image : " 
        read newimage
echo ""      
  echo "Do you want to encrypt ur file with password after extracting it from image:"
        echo "1. Yes" 
        echo "2. No"
        read -p "Enter your choice : " encrypt
       if [ $encrypt == 1 ]
          then
              zip $newimage.zip $file_path -e
       elif [ $encrypt == 2 ]
           then
               zip $newimage.zip $file_path
        fi
       cat $img_path $newimage.zip > $newimage.jpeg
      rm $newimage.zip
      echo "Congrats your encrypted image file is saved succesfully"
      
       echo "1) Encrypt"
      echo "2) Decrypt" 
      echo "3) Quit"
      echo ""
           ;;
"Decrypt")
echo "enter your encrypted image path to decrypt files or folder"
read img2_path
  mv $img2_path decrypted.zip
  mkdir Decrypted_Files
  unzip decrypted.zip -d Decrypted_Files
  rm decrypted.zip
  echo "File decrypted successfully and saved in your system"

       echo "1) Encrypt"
      echo "2) Decrypt" 
      echo "3) Quit"
      echo ""

 ;;
 "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
