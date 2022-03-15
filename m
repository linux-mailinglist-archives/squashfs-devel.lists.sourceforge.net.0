Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C04D9FEC
	for <lists+squashfs-devel@lfdr.de>; Tue, 15 Mar 2022 17:23:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nU9p8-0004bo-D2; Tue, 15 Mar 2022 16:23:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <a.fatoum@pengutronix.de>) id 1nU9p7-0004bc-2J
 for squashfs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 16:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zbAkju+6S7BG2v9CKG+zxPSL+JF7dkVMiX+7Wc+7nyQ=; b=DWqQhEIiwTw3kcflNe0KKEW2qu
 59PLw+psZwzRbtECd3Zavbzctiz4d4BLg5Aq0C0VNzmI6A7HwLLCfcVLc4oBTFGCnREeOxHsi9P2Y
 r4oGli/nVglVjSr1ARLmNy9PWIdm3qg3I3EOuoXVTjWwQY6fgW+OWOUgfPdK+uOKOxmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:
 Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zbAkju+6S7BG2v9CKG+zxPSL+JF7dkVMiX+7Wc+7nyQ=; b=Q
 jQ3LNZtdsKg5zQTsQwVuI8P6O1oaShYJ3HgyEkJgRA6BgiycR29DhRnIqozeVWPgNkbTHzqK/ld7m
 j9lHXjZWc5qSYp5PtyLqkkvM4dVcSEGYMabAiR8YKR+RRwjhHaVezIixEO3uiKdQrK2Rutmjz+lyu
 +7tUp5+lOiBWdGa8=;
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nU9x1-00HIlI-6J
 for squashfs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 16:23:12 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nU9wq-0001IY-Bn; Tue, 15 Mar 2022 17:23:00 +0100
Message-ID: <c22a0f1c-883d-5122-ef88-0d7c57ab4e66@pengutronix.de>
Date: Tue, 15 Mar 2022 17:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: squashfs-devel@lists.sourceforge.net,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: squashfs-devel@lists.sourceforge.net
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, This an issue we had with v5.15 that we have since
 successfully worked around. I am reporting it here as a pointer in case
 someone
 else runs into this and as a heads up that there seems to be an under [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [85.220.165.71 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1nU9x1-00HIlI-6J
Subject: [Squashfs-devel] Possible performance regression with
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hello,

This an issue we had with v5.15 that we have since successfully worked around.
I am reporting it here as a pointer in case someone else runs into this and as
a heads up that there seems to be an underlying performance regression, so
here it goes:

We have an i.MX8MM (4x Cortex-A53) system with squashfs on eMMC as a root file
system. The system originally ran NXP's "imx_5.4.24_2.1.0" which has about
5000 patches on top of upstream v5.4.24 including PREEMPT_RT.

The system was updated to mainline Linux + PREEMPT_RT and boot time suffered
considerably growing from 40s with vendor kernel to 1m20s with mainline-based
kernel.

The slowdown on mainline was reproducible for all scheduling models (with
or without PREEMPT_RT) except for PREEMPT_NONE, which was back at 40s.

The services most impacted by the slowdown were C++ applications with many
shared libraries dynamically loaded from the rootfs.

Looking through the original kernel configuration we found that it has
CONFIG_SQUASHFS_DECOMP_SINGLE=y and CONFIG_SQUASHFS_FILE_CACHE=y.

Once changed to CONFIG_SQUASHFS_FILE_DIRECT=y and
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y, we were below 40s as we want.

That's clearly the preferred configuration and it resolves our problem
It doesn't solve the underlying issue though:

  - CONFIG_PREEMPT_VOLUNTARY performs much worse than CONFIG_PREEMPT_NONE
    for some workloads when CONFIG_SQUASHFS_DECOMP_SINGLE=y

  - And this might not have been the case with v5.4. Unfortunately we can't
    bisect, because there wasn't enough i.MX8MM support mainline back then
    to boot the system. Earliest mainline-based kernel we reproduced this on
    was v5.11.

TL;DR: Check if CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y in your configuration

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
