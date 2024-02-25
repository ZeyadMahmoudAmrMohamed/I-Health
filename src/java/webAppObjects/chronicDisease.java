
package webAppObjects;

import java.io.Serializable;

/**
 *
 * @author zizof
 */
public class chronicDisease implements Serializable{
    private String diseaseName;
    private String patID;

    public chronicDisease() {
    }

    public String getDiseaseName() {
        return diseaseName;
    }

    public void setDiseaseName(String diseaseName) {
        this.diseaseName = diseaseName;
    }

    public String getPatID() {
        return patID;
    }

    public void setPatID(String patID) {
        this.patID = patID;
    }
    
    
    
}
