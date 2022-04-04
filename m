Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F54F1A46
	for <lists+squashfs-devel@lfdr.de>; Mon,  4 Apr 2022 22:59:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nbTnf-0000ln-U5; Mon, 04 Apr 2022 20:59:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <a.fatoum@pengutronix.de>) id 1nbTne-0000lh-DJ
 for squashfs-devel@lists.sourceforge.net; Mon, 04 Apr 2022 20:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wyBisBxZPrTILZULgjdjxrHahw1/KZ62IWV/yfcHbXw=; b=hCocPS+NHVhDoLXo4+YlZ8NDrd
 m+nzbngJZn8VyX9WITweztiwZHGWVJ36/uagkVFAcomq0N4CyYY6BW9R50NHeYixL5zGw+JNiqyLB
 l4MtNzTYVuR5ADxI3n59qu/vGeHCKU+q34RAqgqmy/ClFpJO7/cZ/ic91sXk1iHHZjiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wyBisBxZPrTILZULgjdjxrHahw1/KZ62IWV/yfcHbXw=; b=QgzZUe5fMhGFqL5SEKreicSUZe
 czCbXnmcUd6BCRlvUkLYSEBfylKxxUo8qInoBjDmyQXwRrcllS3tKlZPyzzJSERaTy61y/Ay0jWoK
 xk6bYtPubksetIuBiJm1owsqsDFkyIzS0XQnf/M5uTB4OOvON7jSTGr/7PD6o7+QzKwA=;
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbTnb-0006NA-2A
 for squashfs-devel@lists.sourceforge.net; Mon, 04 Apr 2022 20:59:44 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nbTnI-0004FN-Ih; Mon, 04 Apr 2022 22:59:24 +0200
Message-ID: <5f862219-2e48-72d0-af27-3ab2b5820a95@pengutronix.de>
Date: Mon, 4 Apr 2022 22:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Phillip Lougher <phillip@squashfs.org.uk>
References: <c22a0f1c-883d-5122-ef88-0d7c57ab4e66@pengutronix.de>
 <20220316053428.5758-1-phillip@squashfs.org.uk>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220316053428.5758-1-phillip@squashfs.org.uk>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: squashfs-devel@lists.sourceforge.net
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Phillip, On 16.03.22 06:34, Phillip Lougher wrote: >
 Ahmad Fatoum <a.fatoum@pengutronix.de> wrote: > >> Hello, >> >> This an issue
 we had with v5.15 that we have since successfully worked around. >> I am
 repor [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [85.220.165.71 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nbTnb-0006NA-2A
Subject: Re: [Squashfs-devel] Possible performance regression with
 CONFIG_SQUASHFS_DECOMP_SINGLE
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: squashfs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hello Phillip,

On 16.03.22 06:34, Phillip Lougher wrote:
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> Hello,
>>
>> This an issue we had with v5.15 that we have since successfully worked around.
>> I am reporting it here as a pointer in case someone else runs into this and as
>> a heads up that there seems to be an underlying performance regression, so
>> here it goes:
>>
> 
> [snip]
> 
>>
>> Looking through the original kernel configuration we found that it has
>>  CONFIG_SQUASHFS_DECOMP_SINGLE=y and CONFIG_SQUASHFS_FILE_CACHE=y.
>>
>> Once changed to CONFIG_SQUASHFS_FILE_DIRECT=y and
>> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y, we were below 40s as we want.
> 
> This sounds like the slow-down that was introduced by commit c1f6925e1091
> "mm: put readahead pages in cache earlier" (Linux V5.8)
> 
> This commit prevents Squashfs from doing it's own readahead, which
> causes a slow-down in performance.  The slow-down is noticable when
> using a single decompressor (CONFIG_SQUASHFS_DECOMP_SINGLE=y), and
> can be solved by moving to a multi-decompressor configuration, because
> it removes contention on a single buffer in the single decompressor case.
> 
> This has been already been fixed by commit 9eec1d897139
> "squashfs: provide backing_dev_info in order to disable read-ahead"
> which is in Linux 5.17-rc1.

I just updated to v5.17.1 and I can confirm that this commit fixes the
performance regression. Single decompressor case is now nearly as fast
as multi decompressor. Reverting the fix increased boot time from
30s~ to 2min30s.

Thanks for clearing this up!

Cheers,
Ahmad

> 
> Phillip
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
