using UnityEngine;

public class ShaderKeyWordDebug : MonoBehaviour
{
    public Material material;

    [ContextMenu("RevealKeyWords")]
    private void RevealKeyWords()
    {
        foreach (var localKeywordName in material.shaderKeywords)
        {
            Debug.LogError("Local shader keyword " + localKeywordName + " is currently enabled");
        }
    }
}
