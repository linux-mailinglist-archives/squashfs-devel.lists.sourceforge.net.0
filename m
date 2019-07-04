Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 812725FEB2
	for <lists+squashfs-devel@lfdr.de>; Fri,  5 Jul 2019 01:47:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1hjBRt-0002fL-5W; Thu, 04 Jul 2019 23:47:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <goliath@infraroot.at>)
 id 1hjBRr-0002ex-39; Thu, 04 Jul 2019 23:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H8UkVbDsmqb5mR84Nj8T62LjdsOI0owKlAUvBzzUXvo=; b=bu0bHVgTxtgwn1iWLK7SuOW/aR
 9uOvZ7CAleIbisusH64Qw70dnUtM1/b26tX7gDtI/Bb59aqo1SEjA+GeNoxSgzxKxpZSyBi0GYEsa
 /WvhsgRURcsgduY0Vsm5EZOsO7YhHBtbbNKzDIJrh7/BeLRvMDjUqNVJcXiUJAvbFUUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Cc:To
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H8UkVbDsmqb5mR84Nj8T62LjdsOI0owKlAUvBzzUXvo=; b=F
 t7LC1ScVKGLl45d/JDtjpFj+QQB0Mbhf2gmlcr8R/CwpmIM/L/NEPT0BAZW3AFe8oHwmy3BcslwIi
 KwmaWbbs+QOHMw9fCdLONIiWdPzxaYabrQdPcRjtkq1hXDln0OcfYb7UkbxlDs89wsiyr3yHi7hIN
 Wpp6boLdybr7zUWc=;
Received: from mail.infraroot.at ([54.37.73.54])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hjBS6-008NBS-TP; Thu, 04 Jul 2019 23:47:49 +0000
Received: from [192.168.178.20] (clnet-p04-043.ikbnet.co.at [83.175.81.43])
 by mail.infraroot.at (Postfix) with ESMTPSA id 2A8784090E;
 Fri,  5 Jul 2019 01:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.infraroot.at 2A8784090E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infraroot.at;
 s=default; t=1562284053;
 bh=H8UkVbDsmqb5mR84Nj8T62LjdsOI0owKlAUvBzzUXvo=;
 h=From:Subject:To:Cc:Date:From;
 b=pN52/Xf055L8tcO5X5RPyxvO8RJiiiSNE8b+qUq4uFHBieKQHB0D5UKI5oIb07r1G
 noGhzoXxqiizOsNoFXAkSeFRu8QBu5wHRF2yGbNCWW21mHpbLvTQgD8ij1tQq3qr1L
 uCz+iVgs6SWcgzcoVpFryBohGRkPK/p2eR6yLH5s=
From: David Oberhollenzer <goliath@infraroot.at>
To: squashfs-devel@lists.sourceforge.net
Message-ID: <4c9e09f3-8e01-e8fa-23bb-15c072b47f60@infraroot.at>
Date: Fri, 5 Jul 2019 01:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infraroot.at]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hjBS6-008NBS-TP
Subject: [Squashfs-devel] [ANNOUNCE] squashfs-tools-ng 0.4
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
Cc: squashfs-announce@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi,

this announcement marks the release of a new, much improved version of the
squashfs tooling initially proposed in early June.


Release tarball: https://infraroot.at/pub/squashfs/squashfs-tools-ng-0.4.tar.xz

git tree: https://github.com/AgentD/squashfs-tools-ng


Since the initial announcement (version 0.1), a lot of work has gone into cleanup and
more extensive testing. A number of issues have also been discovered through static
code analysis (coverity scan and similar tools) and have been fixed, leaping closer
to a stable code base.

Feature wise, two additional tools have been added:
 - sqfs2tar
 - tar2sqfs

Doing exactly what the name says, sqfs2tar turns a squashfs image into a tar ball,
written to stdout and tar2sqfs reads a tar ball from stdin (GNU tar, v7, pre-POSIX
ustar, POSIX tar/PAX; supporting Xattrs and sparse files) and generates a squashfs
image.

Regards,

David



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
