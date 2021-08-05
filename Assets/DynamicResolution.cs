using System;
using UnityEngine;
using UnityEngine.UI;

public class DynamicResolution : MonoBehaviour
{
    public Text screenText;
    
    [Range(0.1f, 1.0f)]
    public float renderScale = 1.0f;

    private float _maxResolutionScale = 1.0f;
    private float _minResolutionScale = 0.1f;

    private float _scale = 1.0f;

    void Update()
    {
        float oldScale = _scale;
        _scale = Mathf.Clamp((float)Math.Round(renderScale, 1), _minResolutionScale, _maxResolutionScale);

        if (Math.Abs(_scale - oldScale) > 0.01f)
        {
            ScalableBufferManager.ResizeBuffers(_scale, _scale);
        }
        
        // Debug on screen
        screenText.text = $"Scale: {_scale:F3}\nResolution: " +
                          $"{Mathf.Ceil(ScalableBufferManager.widthScaleFactor * Screen.currentResolution.width)}x" +
                          $"{Mathf.Ceil(ScalableBufferManager.heightScaleFactor * Screen.currentResolution.height)}\n" +
                          $"ScaleFactor: {ScalableBufferManager.widthScaleFactor:F3}x{ScalableBufferManager.heightScaleFactor:F3}";
    }
}
