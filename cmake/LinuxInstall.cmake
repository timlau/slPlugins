    include(GNUInstallDirs)
    set(PLUGINS ABTester AddInvert ChannelMute CompensatedDelay Compressor Crossfeed Delay
        Expander Gate GraphicEQ HugeGain Limiter Maths MidiLooper Oscilloscope PitchTrack
        SFX8 SampleDelay SimpleVerb SpectrumAnalyzer StereoEnhancer StereoProcessor
        ToneGenerator WaveLooper XYScope)
    foreach (plugin ${PLUGINS})
        # message(STATUS "Installing ${plugin} plugin...")
        foreach(format VST3 LV2 CLAP)
            # message(STATUS "  --> Installing ${plugin}_${format} plugin...")
            if(TARGET ${plugin}_${format})
                get_target_property(output ${plugin}_${format} JUCE_PLUGIN_ARTEFACT_FILE)
                install(DIRECTORY ${output} DESTINATION ${CMAKE_INSTALL_LIBDIR}/$<LOWER_CASE:${format}>)
            endif()
        endforeach()
    endforeach()
