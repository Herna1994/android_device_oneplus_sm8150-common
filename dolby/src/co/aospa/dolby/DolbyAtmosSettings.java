package co.aospa.dolby;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.support.v14.preference.PreferenceFragment;
import android.support.v7.preference.ListPreference;

public class DolbyAtmosSettings extends PreferenceActivity {
    private final String TAG = "DolbyAtmosSettings";
    private ListPreference mDolbyAtmosPref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getFragmentManager().beginTransaction()
                .replace(android.R.id.content, new DolbyAtmosPreference()).commit();
    }

    private class DolbyAtmosPreference extends PreferenceFragment {
        private static final String KEY_DOLBY_ATMOS = "dolby_atmos";

        @Override
        public void onCreatePreferences(Bundle bundle, String s) {
            addPreferencesFromResource(R.xml.dolby_atmos_panel);
        }
    }
}
