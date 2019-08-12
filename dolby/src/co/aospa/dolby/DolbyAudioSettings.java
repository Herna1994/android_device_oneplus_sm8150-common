package co.aospa.dolby;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragment;
import androidx.preference.ListPreference;

public class DolbyAudioSettings extends PreferenceActivity {
    private final String TAG = "DolbyAudioSettings";
    private ListPreference mDolbyAudioPref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getFragmentManager().beginTransaction()
                .replace(android.R.id.content, new DolbyAudioPreference()).commit();
    }

    public class DolbyAudioPreference extends PreferenceFragment {
        private static final String KEY_DOLBY_AUDIO = "dolby_audio";

        @Override
        public void onCreatePreferences(Bundle bundle, String s) {
            addPreferencesFromResource(R.xml.dolby_audio_panel);
        }
    }
}
