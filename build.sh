#!/usr/bin/env sh

echo "**************************"
echo "STEP 1/12: cd /srv/src/kpi"
echo "**************************"
cd /srv/src/kpi

echo "*******************************"
echo "STEP 2/12: rm -rf node_modules/"
echo "*******************************"
rm -rf node_modules/

echo "********************************************"
echo "STEP 3/12: npm install -g check-dependencies"
echo "********************************************"
npm install -g check-dependencies

echo "******************************"
echo "STEP 4/12: npm install --quiet"
echo "******************************"
npm install --quiet

echo "**********************************"
echo "STEP 5/12: npm cache clean --force"
echo "**********************************"
npm cache clean --force

echo "******************************"
echo "STEP 6/12: rm -rf jsapp/fonts/"
echo "******************************"
rm -rf jsapp/fonts/

echo "*********************************"
echo "STEP 7/12: rm -rf jsapp/compiled/"
echo "*********************************"
rm -rf jsapp/compiled/

echo "*****************************"
echo "STEP 8/12: npm run copy-fonts"
echo "*****************************"
npm run copy-fonts

echo "************************"
echo "STEP 9/12: npm run build"
echo "************************"
npm run build

echo "****************************************************"
echo "STEP 10/12: python manage.py collectstatic --noinput"
echo "****************************************************"
python manage.py collectstatic --noinput

echo "*******************************"
echo "STEP 11/12: source /etc/profile"
echo "*******************************"
source /etc/profile

echo "*****************"
echo "STEP 12/12: rsync"
echo "*****************"
rsync -aq --delete --chown=www-data "${KPI_SRC_DIR}/staticfiles/" "${NGINX_STATIC_DIR}/"
