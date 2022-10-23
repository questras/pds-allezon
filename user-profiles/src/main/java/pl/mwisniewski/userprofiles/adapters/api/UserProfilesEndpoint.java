package pl.mwisniewski.userprofiles.adapters.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pl.mwisniewski.userprofiles.domain.UserProfileService;
import pl.mwisniewski.userprofiles.domain.model.TimeRange;
import pl.mwisniewski.userprofiles.domain.model.UserProfile;

@RestController
public class UserProfilesEndpoint {
    private final UserProfileService userProfileService;

    public UserProfilesEndpoint(UserProfileService userProfileService) {
        this.userProfileService = userProfileService;
    }

    @PostMapping("/user_profiles/{cookie}")
    public ResponseEntity<UserProfileResponse> userProfiles(
            @PathVariable String cookie,
            @RequestParam("time_range") String timeRangeStr,
            @RequestParam(value = "limit", required = false, defaultValue = "200") int limit,
            @RequestBody(required = false) UserProfileResponse expectedResult
    ) {
        TimeRange domainTimeRange = domainTimeRange(timeRangeStr);
        UserProfile userProfile = userProfileService.getProfile(cookie, domainTimeRange, limit);
        UserProfileResponse response = UserProfileResponse.of(userProfile);

        if (!response.equals(expectedResult)) {
            logDifferentAnswers(response, expectedResult);
        }

        return ResponseEntity.ok(response);
    }

    private TimeRange domainTimeRange(String timeRangeStr) {
        String[] splitTimeRange = timeRangeStr.split("_");
        String startTimeRange = splitTimeRange[0] + DEFAULT_TIMEZONE_SUFFIX;
        String endTimeRange = splitTimeRange[1] + DEFAULT_TIMEZONE_SUFFIX;

        return new TimeRange(startTimeRange, endTimeRange);
    }

    private void logDifferentAnswers(UserProfileResponse actualResponse, UserProfileResponse expectedResponse) {
        if (expectedResponse == null) {
            return;
        }

        logger.warn("Full diff");
        logger.warn("Actual: {}", actualResponse);
        logger.warn("Expected: {}", expectedResponse);
    }

    private static final String DEFAULT_TIMEZONE_SUFFIX = "Z";
    private final Logger logger = LoggerFactory.getLogger(UserProfilesEndpoint.class);
}
