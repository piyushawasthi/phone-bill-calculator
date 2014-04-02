# Phone Bill Calculator

Rudimentary script to automatically calculate the number of minutes, sms and
data you've used in a certain billing period.

I wrote this because my provider (Tele2.nl) doesn't make a difference between
text messages and minutes on it's dashboard and I'd like to know how many
text messages I've send.

The script makes some assumptions about the format. The most important one is
that text messages are saved as 1 minute phone calls. If you regularly make
phone calls of exactly 1 minute, the output of the script can be wrong. So use
it at your own risk.

Another important fact about this script is that it rounds all calls to the next
minute (e.g. a phone call that lasted 1 minute and 23 seconds is billed as 2
minutes). This is in correspondence to the rules of my provider (Tele2).

## Usage
1. Create a file `phone.data` similar to the `phone.data.example` and fill it
with your own data (e.g. taken from `https://www.mijnmobiel.tele2.nl/#bills`).
Unfortunately, Tele2 does not support exporting this data, so you need to copy
paste this from their dashboard.
2. Run `ruby calculator.rb`
