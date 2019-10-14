import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Stream;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.application.Application;
import javafx.stage.Stage;
import javafx.collections.ObservableMap;
import javafx.collections.MapChangeListener;


public class ListFiles {
    public static void main(String[] args) {
      ListFiles listFiles = new ListFiles();
      /* listFiles.listAllFiles("C:\\Users\\jinkersont\\Music\\mp3"); */
      listFiles.listAllFiles("/home/tjinkerson/Music");
    }
    public void listAllFiles(String path){
         try(Stream<Path> paths = Files.walk(Paths.get(path))) {
             paths.forEach(filePath -> {
                 if (Files.isRegularFile(filePath) && filePath.toString().endsWith(".mp3")) {
                     try {
                         System.out.println("File is - " + filePath.toString());
                         Media my_media = new Media("file:///" + filePath.toString().replace('\\', '/'));
                         System.out.println("Name is " + (String)my_media.getMetadata().get("title") 
                                              + ", duration is " + my_media.getDuration() );
                         ObservableMap<String, Object> meta = my_media.getMetadata();
                         meta.addListener((MapChangeListener.Change<? extends String, ? extends Object> chg) -> {
                             for(String key : meta.keySet()) {
                                System.out.println("* - " + key);
                             }
                         });
                     } catch (Exception e) {
                         e.printStackTrace();
                     }
                 }
             });
         } catch (IOException e) {
             e.printStackTrace();
         } 
     }
}
