Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8BD03E2
	for <lists+squashfs-devel@lfdr.de>; Wed,  9 Oct 2019 01:13:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1iHyf6-0004KL-MN; Tue, 08 Oct 2019 23:13:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <goliath@infraroot.at>)
 id 1iHyf4-0004Jr-L8; Tue, 08 Oct 2019 23:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9r+v0BobFYDgRUR3GJAvouCY1hWmo2WOvNF9GkSct/I=; b=EFQ8V7ddPi6ctkGS/pFHYmF5O0
 dFGQFhdbwzgv6XBXL2pIN4y5O89eRdqMQOmShV6WoV8s2nZtiExRtHQQsPMylb6Z1l/dt0mZ6z3uo
 48TweeQHvpGZ3DigCZ4Uml5xQLtvaYhdSDp4sJV3L9HHzFfpqO/jBR0ZywfAM528Ouw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:To:
 Subject:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9r+v0BobFYDgRUR3GJAvouCY1hWmo2WOvNF9GkSct/I=; b=M
 IObrRADiitFUD9/RaRZy57POu8tyiHx1o0aEP7pluJzCOJNJVbvPI92RyGw9FkQ99tpVZMtEn+KWG
 3Ke5VtflNDOAuh+OHW5HpI7urHUtLpac0NGSrTx8P00GLF4z6dSZTRfHIbngwQ4+e7u5NdhPAsgLr
 pr2AKv0jqUqgRhuw=;
Received: from mail.infraroot.at ([54.37.73.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iHyf0-00AW8f-Io; Tue, 08 Oct 2019 23:12:58 +0000
Received: from [192.168.178.20] (clnet-p04-043.ikbnet.co.at [83.175.81.43])
 by mail.infraroot.at (Postfix) with ESMTPSA id 858013FA13;
 Wed,  9 Oct 2019 00:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.infraroot.at 858013FA13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infraroot.at;
 s=default; t=1570575250;
 bh=9r+v0BobFYDgRUR3GJAvouCY1hWmo2WOvNF9GkSct/I=;
 h=From:Subject:To:Date:From;
 b=my1fSMhWTUI6FHulOuehipGjNa3qghsSZwp+jHiGM1adT0D8aCTJTnbK4pna6mus7
 YCh6b3+QuEtdf0PO9gFMNlHpBCWF452xykurIWsyKtFZ7Vel1VYXqHYmS62USkAKg6
 uskJYbinlYtga7A48sJ6Mqw2bjx5hv7zPvEhhcsI=
From: David Oberhollenzer <goliath@infraroot.at>
To: squashfs-announce@lists.sourceforge.net,
 squashfs-devel@lists.sourceforge.net,
 "Laszlo Boszormenyi (GCS)" <gcs@debian.org>,
 Matt Turner <mattst88@gentoo.org>
Message-ID: <89fe3ed9-d8cb-77d8-b2b3-77d293784064@infraroot.at>
Date: Wed, 9 Oct 2019 00:54:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
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
X-Headers-End: 1iHyf0-00AW8f-Io
Subject: [Squashfs-devel] [ANNOUNCE] libsquashfs,
 squashfs-tools-ng 0.7 is released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi,

squashfs-tools-ng 0.7 is released.


Tarball:     https://infraroot.at/pub/squashfs/squashfs-tools-ng-0.7.tar.xz
Signature:   https://infraroot.at/pub/squashfs/squashfs-tools-ng-0.7.tar.xz.asc
Signed tag:  https://github.com/AgentD/squashfs-tools-ng.git v0.7


The major change in this version consists of exposing all of the SquashFS
handling code through a library called libsquashfs. The library code itself
has been re-licensed and is now made available under the terms and
conditions of the LGPL version 3 or later. This allows dynamic linking with
programs under different licenses, including proprietary ones. The rest
of the tools and static helper libraries stay under the GPLv3. They also
contain 3rd party contributions, so that's no longer my call anyway.

The new library allows SquashFS to be used in a wide variety of applications.
Not only applications that work with standard SquashFS images, but also
ones that require a powerful, flexible, archive or package format that can
be easily customized and embedded.

In theory this refactoring should have been easy, since the code was already
neatly structured in sub-components and helper libraries to begin with. In
practice however, it required a little more time than anticipated to cleanly
separate the generic stuff from the tool specific code, polishing the API
and re-testing a lot of things.


Changes from 0.6.1 to 0.7:

Features:
- LGPLv3 licensed, library `libsquashfs` containing all the SquashFS logic.
- Legacy LZMA 1 compression support.
- User configurable queue backlog for tar2sqfs and gensquashfs.
- Make sqfsdiff continue comparing even if the types are different,
  but compatible (e.g. extended directory vs basic directory).
- In gensquashfs & tar2sqfs, try to determine the number of available CPU
  cores and use the maximum by default.
- Make "--keep-time" the default for tar2sqfs and use a flag to disable it.

Fixed:
- An off-by-one error in the directory index count.
- Typo in configure fallback path searching for LZO library.
- Typo that caused LZMA2 VLI filters to not be used at all.
- Possible out-of-bounds access in LZO compressor constructor.
- Inverted logic in sqfs2tar extended attributes processing.
- Start numbering inodes at 1, instead of 2.
- Omit the mode bits in the inodes, only store permissions.

Removed:
- Comparison with directory from sqfsdiff.


Regards,

David


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
