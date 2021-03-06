-- This file will have plenty of selects that we need to do for a main configuration of a new repository

-- Problem: Wrong redirect
UPDATE `core_config_data` 
SET `value`='http://did.dev/' 
WHERE `path`='web/unsecure/base_url' OR `path`='web/secure/base_url';

-- Problem: Path to dir in link
UPDATE `core_config_data` 
SET `value`='0' 
WHERE `path`='dev/css/merge_css_files' OR `path`='dev/js/merge_files';

-- Problem: cant log in the backend
DELETE 
FROM `core_config_data` 
WHERE `path`='web/cookie/cookie_domain' OR `path`='web/cookie/cookie_path';

-- Problem: cant log in the backend ( wrong link )
UPDATE `core_config_data`
SET `value` = 0
WHERE `path` = 'admin/url/use_custom';

-- Problem: cant log in the backend ( wrong link )
DELETE FROM `core_config_data`
WHERE `path` = 'admin/url/custom';

UPDATE `core_config_data`
SET `value` = 0
WHERE `path` = 'admin/url/use_custom_path';

-- Problem: You cant see the cookie from the backend being made
select * from core_config_data
WHERE  path like "%web/cookie/cookie_domain%"

-- Problem: We only can access with http, you must configure this:
UPDATE `core_config_data` 
SET `value`='0' 
WHERE `path`='web/cookie/cookie_httponly';




